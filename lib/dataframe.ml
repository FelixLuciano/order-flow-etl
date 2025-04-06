open Series

module DataFrame (S : Series) = struct
  type t = {
    mutable data : S.t list
  }

  let constructor l = 
    { data = l }
  ;;

  let init () =
    constructor []
  ;;

  let append df row =
    df.data <- row :: df.data;
    row
  ;;

  let push df a = append df (S.constructor a)
;;

  let tail df n =
    List.nth df.data n
  ;;

  let filter f df =
    { data = List.filter f df.data }
  ;;

  let map f df =
    List.map f df.data
  ;;

  let reduce f a df =
    List.fold_right f df.data a
  ;;

  let load df data =
    List.iter (fun entry ->
      let _ = push df entry in ()
    ) data
  ;;

  let store df f =
    let dump = (List.map (fun row -> S.dump row) (List.rev df.data)) in
    f (S.columns :: dump)

end ;;
