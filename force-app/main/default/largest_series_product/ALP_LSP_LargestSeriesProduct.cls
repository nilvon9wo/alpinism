public with sharing class ALP_LSP_LargestSeriesProduct {
    private ALP_LSP_LargestSeriesProduct() {
    }

    public static ALP_LSP_LargestSeriesProduct instance;
    public static ALP_LSP_LargestSeriesProduct getInstance() {
        if (instance == null) {
            instance = new ALP_LSP_LargestSeriesProduct();
        }
        return instance;
    }

    /*
        Finds the largest product of a given number of consecutive numbers in a given string of numbers.
    */
    public Integer largestProduct(String series, Integer size) {
        if (size == 0) {
            return 1;
        }
        this.validateInput(series, size);
        return this.findProducts(series, size)
                .max();
    }

    private XAP_INT_IntegerList findProducts(String series, Integer size) {
        XAP_INT_IntegerList productList = new XAP_INT_IntegerList();
        for (Integer i = 0; i < series.length() - size + 1; i++) {
            productList.add(this.extractSubSeries(series, size, i));
        }
        return productList;
    }

    private XAP_INT_IntegerList extractSubSeries(String series, Integer size, Integer start) {
        XAP_INT_IntegerList seriesList = new XAP_INT_IntegerList();
        for (Integer i = start; i < series.length() - size + 1; i++) {
            String substring = series.substring(i, i + size);
            seriesList.add(this.calculateProduct(substring));
        }
        return seriesList;
    }

    private Integer calculateProduct(String substring) {
        Integer product = 1;
        for (Integer i = 0; i < substring.length(); i++) {
            product *= Integer.valueOf(substring.substring(i, i + 1));
        }
        return product;
    }

    private ALP_LSP_LargestSeriesProduct validateInput(String series, Integer size) {
        if (String.isBlank(series)) {
            throw new ALP_LSP_IllegalArgumentException('Series cannot be blank.');
        }
        if (!series.isNumeric()) {
            throw new ALP_LSP_IllegalArgumentException('Series must only contain numbers.');
        }
        if (size < 0) {
            throw new ALP_LSP_IllegalArgumentException('Size must be non-negative.');
        }
        if (size > series.length()) {
            throw new ALP_LSP_IllegalArgumentException('Size cannot be larger than series length.');
        }
        return this;
    }
}