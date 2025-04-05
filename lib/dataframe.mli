(** Functor que cria um DataFrame baseado em uma série de dados *)
module DataFrame : functor (S : Series.Series) -> sig

  (** Dados tabulares da série Series *)
  type t = { mutable data : S.t list; }


  (** Constrói um DataFrame a partir de uma lista de séries
      @param l Lista de valores do tipo [S.t]
      @return Um DataFrame com os dados da lista *)
  val constructor : S.t list -> t


  (** Inicializa um DataFrame vazio. *)
  val init : unit -> t

  (** Adiciona uma nova série ao DataFrame
      @param df O DataFrame
      @param row A série a ser adicionada
      @return O DataFrame com a linha adicionada *)
  val append : t -> S.t -> S.t


  (** Constrói e adiciona uma nova série ao DataFrame a partir de uma lista de strings
      @param df O DataFrame
      @param a Lista de strings representando os valores da série
      @return O DataFrame com a linha adicionada *)
  val push : t -> string list -> S.t

  (** Retorna o n-ésimo elemento do DataFrame, começando em 0
      @param df O DataFrame
      @param n Índice da linha desejada
      @return A série no índice especificado *)
  val tail : t -> int -> S.t

  (** Filtra o DataFrame de modo programático a partir de um callback
      @param f Função predicado que recebe uma Series do DataFrame e retorna sua confição de filtragem
      @param df O DataFrame original
      @return Um novo DataFrame contendo apenas as filtradas *)
  val filter : (S.t -> bool) -> t -> t

  (** Aplica uma funçãode transformação no DataFrame
      @param f Função a ser aplicada
      @param df O dataframe
      @return Lista com os resultados da transformação *)
  val map : (S.t -> 'a) -> t -> 'a list

  (** Agrega os dados do Datarame, linha a linha
      @param f Função de agregação
      @param a Valor inicial
      @param df O dataframe
      @return O resultado final *)
  val reduce : (S.t -> 'a -> 'a) -> 'a -> t -> 'a

  (** Carrega múltiplas linhas no dataframe a partir de listas de strings, sendo cada uma, uma série
      @param df O dataframe
      @param data Lista de listas de strings *)
  val load : t -> string list list -> unit

  (** Serializa o DataFrame para exportação
      @param df O dataframe.
      @param f Função que recebe os dados serializados e retorna o resultado da exportação; a primeira são as colunas da tabela *)
  val store : t -> (string list list -> unit) -> unit

end
