public with sharing class ALP_ALG_Allergies {
    private ALP_ALG_Allergies() {
    }

    private static ALP_ALG_Allergies instance;
    public static ALP_ALG_Allergies getInstance() {
        if (instance == null) {
            instance = new ALP_ALG_Allergies();
        }
        return instance;
    }

    // @see: https://stackoverflow.com/questions/32581069/c-program-what-is-the-simplest-way-to-find-the-exponent-of-a-power-of-2-number
    public List<ALP_ALG_Allergen> toList(Integer code) {
        Integer activeCode = this.ignoreUnassignedValues(code);

        return null;
    }

    private Integer ignoreUnassignedValues(Integer code) {
        while (code > ALP_ALG_AllergenHelper.CODE_TOTAL) {
            code = code - this.findHighestSmallEnoughPowerOf2(code);
        }
        return code;
    }

    private Integer findHighestSmallEnoughPowerOf2(Integer code) {
        Integer powerOfTwo = ALP_ALG_AllergenHelper.HIGHEST_ASSIGNED_CODE;
        while (powerOfTwo <= code) {
            powerOfTwo *= 2;
        }
        return powerOfTwo /= 2;
    }

/*
  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags),
    do: list(flags, _to_check_allergens = @allergens, possessed_allergies = [])

  defp list(0 = _flags, _to_check_allergens, possessed_allergies),
    do:
      possessed_allergies
      |> Enum.map(&Atom.to_string/1)

  defp list(flags, to_check_allergens, possessed_allergies)
       when flags <= @allergen_total,
       do: translate_code(flags, to_check_allergens, possessed_allergies)

  defp list(flags, to_check_allergens, possessed_allergies),
    do:
      flags
      |> ignore_extra_flags()
      |> list(to_check_allergens, possessed_allergies)

  defp translate_code(flags, [] = to_check_allergens, possessed_allergies),
    do: list(0, to_check_allergens, possessed_allergies)

  defp translate_code(flags, [first_allergen | remaining_allergens], possessed_allergies) do
    allergen_code = @value_by_allergen[first_allergen]

    if allergen_code <= flags,
      do:
        list(flags - allergen_code, remaining_allergens, [first_allergen | possessed_allergies]),
      else: list(flags, remaining_allergens, possessed_allergies)
  end

  defp ignore_extra_flags(flags),
    do: ignore_extra_flags(flags, highest_power_of_2(flags))

  defp ignore_extra_flags(flags, highest_code)
       when flags <= @allergen_total,
       do: flags

  defp ignore_extra_flags(flags, highest_code),
    do: ignore_extra_flags(flags - highest_code, highest_code / 2)

  defp highest_power_of_2(number, last_attempted \\ @highest_assigned_allergen_code) do
    next_attempt = last_attempted * 2

    if next_attempt > next_attempt,
      do: last_attempted,
      else: highest_power_of_2(number, next_attempt)
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item),
    do:
      flags
      |> list()
      |> Enum.member?(item)
end

 */
    public Boolean isAllergicTo(Integer code, String allergen) {
        return null;
    }

    private Boolean isAllergicTo(Integer code, ALP_ALG_Allergen allergen) {
        return null;
    }

}