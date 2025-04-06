open Mainlib.Series

(** Série que representa um relatório de ordem de compra *)
module Report : sig
    include Series

    (** Tipo concreto da série *)
    type t = {
        order_id :    int;
        total_amount: float;
        total_taxes:  float;
    }

    (** Cria uma ordem de compra
        @param order_id ID do pedido
        @param total_amount Preço total dos itens (item x quantidade)
        @param total_taxes Imposto total aplicado sobre os itens (preço total x taxa)
        @return Ordem de compra criada *)
    val create : int -> float -> float -> t

    (** Constroi um relatório de ordem de serviço a partir de strings
        @param values Lista de strings, na ordem: order_id; total_amount; total_taxes
        @return Ordem de compra criada *)
    val constructor : string list -> t

    (** Serializa uma ordem de compra
        @return Lista de strings, na ordem: order_id; total_amount; total_taxes *)
    val dump : t -> string list

    (** Imprime um pedido no formato legível *)
    val print : t -> unit

end ;;
