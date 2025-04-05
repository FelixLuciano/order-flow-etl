(** Signature de uma série abstrata de dados tabulares *)
module type Series = sig

  (** Tipo abstrato da série *)
  type t

  (** Lista de nomes das colunas da série *)
  val columns : string list

  (** Constrói uma nova série a partir de uma lista de strings;
      Os valores devem estarn na ordem definida por [columns]
    @param values campos da série como string
    @return Um valor do tipo [t] representando a série *)
  val constructor : string list -> t

  (** Serializa a série em uma lista de strings;
      Os valores são retornados na ordem definida por [columns]
      @param series A série a ser convertida
      @return Lista de strings representando os valores da série *)
  val dump : t -> string list

end
