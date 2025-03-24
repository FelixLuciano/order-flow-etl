module CsvLoader = struct

  let load filename =
    match Csv.load filename with
    | _ :: body -> body
    | _ -> []
  ;;

  let store filename data =
    let file = open_out filename in
    let chan = Csv.to_channel file in
    Csv.output_all chan data;
    close_out file
  ;;

end ;;
