// @see: https://www.redblobgames.com/grids/hexagons/
public with sharing class ALP_CONX_HexGrid {
	private final ALP_CONX_HexCellFactory cellFactory;

	private final List<ALP_CONX_HexCell> cellList;
	private final Integer rowMaximum;
	private final Integer columnMaximum;

	private ALP_CONX_HexGrid(
			List<ALP_CONX_HexCell> cellList,
			ALP_CONX_HexCellFactory cellFactory
	) {
		this.cellFactory = cellFactory;

		this.cellList = cellList;
		this.rowMaximum = this.findMaxRow();
		this.columnMaximum = this.findMaxColumn();
	}

	public ALP_CONX_HexGrid(List<String> board) {
		this(board, ALP_CONX_HexCellFactory.getInstance());
	}

	private ALP_CONX_HexGrid(List<String> board, ALP_CONX_HexCellFactory cellFactory) {
		this(cellFactory.fromStringList(board), cellFactory);
	}

	private Integer findMaxRow() {
		return this.findMaximum(ALP_Cell__c.Row__c);
	}

	private Integer findMaxColumn() {
		return this.findMaximum(ALP_Cell__c.Column__c);
	}

	private Integer findMaximum(SObjectField axis) {
		Integer maximum = 0;
		for (ALP_CONX_HexCell cell : cellList) {
			Integer value = cell.get(axis);
			if (value > maximum) {
				maximum = value;
			}
		}
		return maximum;
	}

	public Boolean isConnected(ALP_CONX_Colour colour, ALP_CONX_Orientation orientation) {
		List<ALP_CONX_HexCell> occupiedCellList = new ALP_CONX_HexCellList(this.cellList)
				.filter(new ALP_CONX_MatchingColourFilter(colour))
				.toList();

		List<ALP_CONX_HexCell> connectedStartCellList = this.findStartCellList(occupiedCellList, orientation);
		List<ALP_CONX_HexCell> connectedEndCellList = this.findEndCellList(occupiedCellList, orientation);
		return this.isConnected(occupiedCellList, connectedStartCellList, connectedEndCellList);
	}

	public Boolean isConnected(
			List<ALP_CONX_HexCell> occupiedCellList,
			List<ALP_CONX_HexCell> connectedStartCellList,
			List<ALP_CONX_HexCell> connectedEndCellList
	) {
		return !connectedStartCellList.isEmpty()
				&& !connectedEndCellList.isEmpty()
				&& (
				this.isOverlapping(connectedStartCellList, connectedEndCellList)
						|| this.hasMoreConnections(occupiedCellList, connectedStartCellList, connectedEndCellList)
		);
	}

	private List<ALP_CONX_HexCell> findStartCellList(
			List<ALP_CONX_HexCell> occupiedCellList,
			ALP_CONX_Orientation orientation
	) {
		Integer maximum = this.getMaximumFor(orientation);
		List<ALP_CONX_HexCell> startCellList = this.cellFactory.generateStartCellList(orientation, maximum);
		return this.findMatchedLocations(occupiedCellList, startCellList);
	}

	private List<ALP_CONX_HexCell> findEndCellList(
			List<ALP_CONX_HexCell> occupiedCellList,
			ALP_CONX_Orientation orientation
	) {
		Integer maximum = this.getMaximumFor(orientation);
		List<ALP_CONX_HexCell> endCellList = this.cellFactory.generateEndCellList(orientation, maximum);
		return this.findMatchedLocations(occupiedCellList, endCellList);
	}

	private Integer getMaximumFor(ALP_CONX_Orientation orient) {
		return (ALP_CONX_Orientation.HORIZONTAL.equals(orient))
				? columnMaximum
				: rowMaximum;
	}

	private List<ALP_CONX_HexCell> findMatchedLocations(
			List<ALP_CONX_HexCell> occupiedCellList,
			List<ALP_CONX_HexCell> requiredCellList
	) {
		return this.findMatchedLocations(occupiedCellList, this.createLocationStringSet(requiredCellList));
	}

	private List<ALP_CONX_HexCell> findMatchedLocations(
			List<ALP_CONX_HexCell> occupiedCellList,
			Set<String> requiredLocationStringSet
	) {
		List<ALP_CONX_HexCell> matchedCellList = new List<ALP_CONX_HexCell>();
		for (ALP_CONX_HexCell occupiedCell : occupiedCellList) {
			if (requiredLocationStringSet.contains(occupiedCell.toLocationString())) {
				matchedCellList.add(occupiedCell);
			}
		}
		return matchedCellList;
	}

	private Set<String> createLocationStringSet(List<ALP_CONX_HexCell> hexCellList) {
		Set<String> locationStringSet = new Set<String>();
		for (ALP_CONX_HexCell cell : hexCellList) {
			locationStringSet.add(cell.toLocationString());
		}
		return locationStringSet;
	}

	private Boolean isOverlapping(
			List<ALP_CONX_HexCell> connectedStartCellList,
			List<ALP_CONX_HexCell> connectedEndCellList
	) {
		return !this.findMatchedLocations(connectedStartCellList, connectedEndCellList)
				.isEmpty();
	}

	private Boolean hasMoreConnections(
			List<ALP_CONX_HexCell> disconnectedCellList,
			List<ALP_CONX_HexCell> connectedStartCellList,
			List<ALP_CONX_HexCell> connectedEndCellList
	) {
		if (disconnectedCellList.isEmpty()) {
			return false;
		}

		connectedStartCellList.addAll(this.findNeighbours(disconnectedCellList, connectedStartCellList));
		connectedEndCellList.addAll(this.findNeighbours(disconnectedCellList, connectedEndCellList));

		List<ALP_CONX_HexCell> remainingDisconnectedCellList
				= findDisconnectedCells(disconnectedCellList, connectedStartCellList, connectedEndCellList);

		return this.isOverlapping(connectedStartCellList, connectedEndCellList)
				|| (
				(disconnectedCellList.size() != remainingDisconnectedCellList.size())
						&& this.hasMoreConnections(remainingDisconnectedCellList, connectedStartCellList, connectedEndCellList)
		);
	}

	private List<ALP_CONX_HexCell> findNeighbours(
			List<ALP_CONX_HexCell> disconnectedCellList,
			List<ALP_CONX_HexCell> connectedCellList
	) {
		return new ALP_CONX_HexCellList(disconnectedCellList)
				.filter(new ALP_CONX_CellNeighbourFilter(connectedCellList))
				.toList();
	}

	private static List<ALP_CONX_HexCell> findDisconnectedCells(
			List<ALP_CONX_HexCell> previouslyDisconnectedCellList,
			List<ALP_CONX_HexCell> connectedStartCellList,
			List<ALP_CONX_HexCell> connectedEndCellList
	) {
		List<ALP_CONX_HexCell> allConnectedCellList = new ALP_CONX_HexCellList(connectedStartCellList)
				.add(connectedEndCellList)
				.toList();

		return new ALP_CONX_HexCellList(previouslyDisconnectedCellList)
				.filter(new ALP_CONX_CellDisconnectedFilter(allConnectedCellList))
				.toList();
	}
}