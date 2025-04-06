module HttpCsvLoader = struct

  let load url =
    let content =
      match Ezcurl.get ~url () with
      | Ok c -> c.body
      | Error (_, s) -> failwith s
    in
    match Csv.input_all (Csv.of_string content) with
    | _ :: body -> body
    | _ -> []
  ;;

  let store _ _ =
    failwith "Not implemented!"
  ;;

end ;;
