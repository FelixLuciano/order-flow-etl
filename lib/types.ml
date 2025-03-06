module Types = struct
  type primaryKey = PrimaryKey of int ;;

  type foreignKey = ForeignKey of int ;;

  type currencyAmount = CurrencyAmount of float ;;

  type dateISO = DateISO of string ;;
end ;;
