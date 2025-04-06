(** Módulo importação e exportação de dados no formaod de arquivos CSVa partir da WEB;
    As operações são impuras e requerem acesso a internet. *)
module HttpCsvLoader : sig

    (** Carrega um arquivo CSV da WEB e o transforma em uma lista de listas de strings
        @param url Caminho para o arquivo CSV
        @return Lista de listas de strings representando o conteúdo do arquivo *)
    val load : string -> string list list

    (** NÃO IMPLEMENTADO! Salva dados no formato CSV em um arquivo
        @param filename Caminho do arquivo a ser exportado
        @param data Lista de listas de strings dos dados *)
    val store : string -> string list list -> unit

end ;;
