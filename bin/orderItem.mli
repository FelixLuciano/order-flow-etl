open Mainlib.Series

(** Série que representa um item em uma ordem de compra *)
module OrderItem : sig

    include Series

    (** Tipo concreto da série *)
    type t = {
        item_id :  int;
        order_id : int;
        quantity : int;
        price :    float;
        tax :      float;
    }

    (** Lista de colunas que compõem o dado, na ordem: item_id; order_id; quantity; price; tax *)
    val columns : (string * string * string * string * string) list

    (** Cria um item de ordem de compra
        @param item_id Identificador do item
        @param order_id Identificador da ordem relacionada
        @param quantity Quantidade do item
        @param price Preço unitário do item
        @param tax Imposto aplicado sobre o item
        @return O item de criado *)
    val create : int -> int -> int -> float -> float -> t

    (** Constroi um item de ordem de compra a partir de strings
        @param values Lista de strings, na ordem: item_id; order_id; quantity; price; tax
        @return O item de criado *)
    val construct : string list -> t

    (** Imprime um item de ordem de compra no formato legível
        @param o item a ser impresso *)
    val dump : t -> string list

end ;;
