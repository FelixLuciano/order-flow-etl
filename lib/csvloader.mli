(** Módulo importação e exportação de dados no formaod de arquivos CSV;
    As operações são impuras e requerem acesso ao sistema de arquivos. *)
module CsvLoader : sig

    (** Carrega um arquivo CSV e o transforma em uma lista de listas de strings
        @param filename Caminho para o arquivo CSV
        @return Lista de listas de strings representando o conteúdo do arquivo *)
    val load : string -> string list list


    (** Salva dados no formato CSV em um arquivo
        @param filename Caminho do arquivo a ser exportado
        @param data Lista de listas de strings dos dados *)
    val store : string -> string list list -> unit

end ;;
