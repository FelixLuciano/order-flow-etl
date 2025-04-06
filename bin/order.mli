open Mainlib.Series

(** Série que representa uma ordem de compra *)
module Order : sig
    include Series

    (** Estado de um pedido. *)
    type status = Pending | Complete | Cancelled

    (** Origem de um pedido. *)
    type origin = Online | Physical

    (** Tipo concreto da série *)
    type t = {
        id :         int;
        client_id :  int;
        order_date : string;
        status :     status;
        origin :     origin;
    }

    (** Converte um valor de [status] para string
        @param s Valor do tipo [status]
        @return String representando o status *)
    val string_of_orderStatus : status -> string

    (** Converte uma string para um [status]
        @param s String representando o status
        @return Valor do tipo [status] *)
    val orderStatus_of_string : string -> status

    (** Converte um valor de [origin] para string
        @param o Valor do tipo [origin].
        @return String representando a origem da ordem *)
    val string_of_orderOrigin : origin -> string

    (** Converte uma string para um [origin]
        @param s String representando a origem
        @return Valor do tipo [origin] *)
    val orderOrigin_of_string : string -> origin

    (** Cria uma ordem de compra
        @param id ID do pedido
        @param client_id ID do cliente
        @param date Data do pedido como string
        @param status Status como string
        @param origin Origem como string
        @return Ordem de compra criada *)
    val create : int -> int -> string -> string -> string -> t

    (** Constroi uma ordem de serviço a partir de strings
        @param values Lista de strings, na ordem: id; client_id; order_date; status; origin
        @return Ordem de compra criada *)
    val constructor : string list -> t

    (** Serializa uma ordem de compra
        @return Lista de strings, na ordem: id; client_id; order_date; status; origin *)
    val dump : t -> string list

    (** Imprime um pedido no formato legível
        @param o Pedido a ser impresso *)
    val print : t -> unit

end ;;
