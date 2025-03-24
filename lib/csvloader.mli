module CsvLoader : sig

    val load : string -> string list list
    val store : string -> string list list -> unit

end ;;
