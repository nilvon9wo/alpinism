public with sharing class ALP_KLNG_LanguageList {

    private static final Set<String> EXCITING_LANGUAGES = new Set<String>{'Java', 'Kotlin'};

    private final List<String> languages = new List<String>();

    public Boolean isEmpty() {
        return languages.isEmpty();
    }

    public void addLanguage(String language) {
        languages.add(language);
    }

    public void removeLanguage(String language) {
        Integer index = languages.indexOf(language);
        languages.remove(index);
    }

    public String firstLanguage() {
        return languages[0];
    }

    public Integer count() {
        return languages.size();
    }

    public Boolean containsLanguage(String language) {
        return languages.contains(language);
    }

    public Boolean isExciting() {
        for (String language : languages) {
            if (EXCITING_LANGUAGES.contains(language)) {
                return true;
            }
        }

        return false;
    }

}