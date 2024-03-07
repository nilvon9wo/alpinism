public with sharing class ALP_CSQ_CryptoSquare {
    private ALP_CSQ_CryptoSquare() {
    }

    private static ALP_CSQ_CryptoSquare instance;
    public static ALP_CSQ_CryptoSquare getInstance() {
        if (instance == null) {
            instance = new ALP_CSQ_CryptoSquare();
        }
        return instance;
    }

    /*
        Encode string square methods
    */
    public String encode(String plainText) {
        if (String.isBlank(plainText)) {
            return '';
        }

        String normalizedText = this.normalize(plainText);
        List<String> rectangleTextRowList = this.toRectangle(normalizedText);
        return this.encode(rectangleTextRowList);
    }

    private String normalize(String plainText) {
        return plainText.toLowerCase()
                .replaceAll('[^a-z0-9]', '');
    }

    private List<String> toRectangle(String normalizedText) {
        Integer columns = this.calculateColumns(normalizedText.length());
        List<String> accumulatorList = new List<String>();
        return this.makeRows(normalizedText, columns, accumulatorList);
    }

    private Integer calculateColumns(Integer textLength) {
        Double squareRoot = Math.sqrt(textLength);
        Integer truncatedRoot = squareRoot.intValue();
        Integer columns = (squareRoot == truncatedRoot)
                ? truncatedRoot
                : truncatedRoot + 1;

        return (Math.pow(columns, 2) >= textLength)
                ? columns
                : columns + 1;
    }

    private List<String> makeRows(String text, Integer columns, List<String> accumulatorList) {
        Integer textLength = text.length();
        if (textLength <= columns) {
            accumulatorList.add(text.rightPad(columns).trim());
            return accumulatorList;
        } else {
            accumulatorList.add(text.substring(0, columns));
            return this.makeRows(
                    text.substring(columns, textLength),
                    columns,
                    accumulatorList
            );
        }
    }

    private String encode(List<String> rectangleTextRowList) {
        Map<Integer, String> encodedRowByIndexMap = new Map<Integer, String>();
        for (String rectangleTextRow : rectangleTextRowList) {
            List<String> rectangleRowLetterList = rectangleTextRow.split('');
            for (Integer i = 0; i < rectangleRowLetterList.size(); i++) {
                String oldRow = (encodedRowByIndexMap.containsKey(i))
                        ? encodedRowByIndexMap.get(i)
                        : '';
                encodedRowByIndexMap.put(i, oldRow + rectangleRowLetterList[i]);
            }
        }
        return String.join(encodedRowByIndexMap.values(), ' ');
    }
}