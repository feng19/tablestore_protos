# credo:disable-for-this-file
defmodule(ExAliyunOts.TableStore.TimeRange) do
  @moduledoc false
  (
    defstruct(start_time: nil, end_time: nil, specific_time: nil)

    (
      (
        @spec encode(struct) :: {:ok, iodata} | {:error, any}
        def(encode(msg)) do
          try do
            {:ok, encode!(msg)}
          rescue
            e in [Protox.EncodingError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        @spec encode!(struct) :: iodata | no_return
        def(encode!(msg)) do
          [] |> encode_start_time(msg) |> encode_end_time(msg) |> encode_specific_time(msg)
        end
      )

      []

      [
        defp(encode_start_time(acc, msg)) do
          try do
            case(msg.start_time) do
              nil ->
                acc

              _ ->
                [acc, "\b", Protox.Encode.encode_int64(msg.start_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:start_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end,
        defp(encode_end_time(acc, msg)) do
          try do
            case(msg.end_time) do
              nil ->
                acc

              _ ->
                [acc, <<16>>, Protox.Encode.encode_int64(msg.end_time)]
            end
          rescue
            ArgumentError ->
              reraise(Protox.EncodingError.new(:end_time, "invalid field value"), __STACKTRACE__)
          end
        end,
        defp(encode_specific_time(acc, msg)) do
          try do
            case(msg.specific_time) do
              nil ->
                acc

              _ ->
                [acc, <<24>>, Protox.Encode.encode_int64(msg.specific_time)]
            end
          rescue
            ArgumentError ->
              reraise(
                Protox.EncodingError.new(:specific_time, "invalid field value"),
                __STACKTRACE__
              )
          end
        end
      ]

      []
    )

    (
      (
        @spec decode(binary) :: {:ok, struct} | {:error, any}
        def(decode(bytes)) do
          try do
            {:ok, decode!(bytes)}
          rescue
            e in [Protox.DecodingError, Protox.IllegalTagError, Protox.RequiredFieldsError] ->
              {:error, e}
          end
        end

        (
          @spec decode!(binary) :: struct | no_return
          def(decode!(bytes)) do
            parse_key_value(bytes, struct(ExAliyunOts.TableStore.TimeRange))
          end
        )
      )

      (
        @spec parse_key_value(binary, struct) :: struct
        defp(parse_key_value(<<>>, msg)) do
          msg
        end

        defp(parse_key_value(bytes, msg)) do
          {field, rest} =
            case(Protox.Decode.parse_key(bytes)) do
              {0, _, _} ->
                raise(%Protox.IllegalTagError{})

              {1, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[start_time: value], rest}

              {2, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[end_time: value], rest}

              {3, _, bytes} ->
                {value, rest} = Protox.Decode.parse_int64(bytes)
                {[specific_time: value], rest}

              {tag, wire_type, rest} ->
                {_, rest} = Protox.Decode.parse_unknown(tag, wire_type, rest)
                {[], rest}
            end

          msg_updated = struct(msg, field)
          parse_key_value(rest, msg_updated)
        end
      )

      []
    )

    (
      @spec json_decode(iodata(), keyword()) :: {:ok, struct()} | {:error, any()}
      def(json_decode(input, opts \\ [])) do
        try do
          {:ok, json_decode!(input, opts)}
        rescue
          e in Protox.JsonDecodingError ->
            {:error, e}
        end
      end

      @spec json_decode!(iodata(), keyword()) :: struct() | no_return()
      def(json_decode!(input, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :decode)

        Protox.JsonDecode.decode!(
          input,
          ExAliyunOts.TableStore.TimeRange,
          &json_library_wrapper.decode!(json_library, &1)
        )
      end

      @spec json_encode(struct(), keyword()) :: {:ok, iodata()} | {:error, any()}
      def(json_encode(msg, opts \\ [])) do
        try do
          {:ok, json_encode!(msg, opts)}
        rescue
          e in Protox.JsonEncodingError ->
            {:error, e}
        end
      end

      @spec json_encode!(struct(), keyword()) :: iodata() | no_return()
      def(json_encode!(msg, opts \\ [])) do
        {json_library_wrapper, json_library} = Protox.JsonLibrary.get_library(opts, :encode)
        Protox.JsonEncode.encode!(msg, &json_library_wrapper.encode!(json_library, &1))
      end
    )

    @deprecated "Use fields_defs()/0 instead"
    @spec defs() :: %{
            required(non_neg_integer) => {atom, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs()) do
      %{
        1 => {:start_time, {:scalar, 0}, :int64},
        2 => {:end_time, {:scalar, 0}, :int64},
        3 => {:specific_time, {:scalar, 0}, :int64}
      }
    end

    @deprecated "Use fields_defs()/0 instead"
    @spec defs_by_name() :: %{
            required(atom) => {non_neg_integer, Protox.Types.kind(), Protox.Types.type()}
          }
    def(defs_by_name()) do
      %{
        end_time: {2, {:scalar, 0}, :int64},
        specific_time: {3, {:scalar, 0}, :int64},
        start_time: {1, {:scalar, 0}, :int64}
      }
    end

    @spec fields_defs() :: list(Protox.Field.t())
    def(fields_defs()) do
      [
        %{
          __struct__: Protox.Field,
          json_name: "startTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :start_time,
          tag: 1,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "endTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :end_time,
          tag: 2,
          type: :int64
        },
        %{
          __struct__: Protox.Field,
          json_name: "specificTime",
          kind: {:scalar, 0},
          label: :optional,
          name: :specific_time,
          tag: 3,
          type: :int64
        }
      ]
    end

    [
      @spec(field_def(atom) :: {:ok, Protox.Field.t()} | {:error, :no_such_field}),
      (
        def(field_def(:start_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 1,
             type: :int64
           }}
        end

        def(field_def("startTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 1,
             type: :int64
           }}
        end

        def(field_def("start_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "startTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :start_time,
             tag: 1,
             type: :int64
           }}
        end
      ),
      (
        def(field_def(:end_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 2,
             type: :int64
           }}
        end

        def(field_def("endTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 2,
             type: :int64
           }}
        end

        def(field_def("end_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "endTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :end_time,
             tag: 2,
             type: :int64
           }}
        end
      ),
      (
        def(field_def(:specific_time)) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "specificTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :specific_time,
             tag: 3,
             type: :int64
           }}
        end

        def(field_def("specificTime")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "specificTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :specific_time,
             tag: 3,
             type: :int64
           }}
        end

        def(field_def("specific_time")) do
          {:ok,
           %{
             __struct__: Protox.Field,
             json_name: "specificTime",
             kind: {:scalar, 0},
             label: :optional,
             name: :specific_time,
             tag: 3,
             type: :int64
           }}
        end
      ),
      def(field_def(_)) do
        {:error, :no_such_field}
      end
    ]

    []
    @spec required_fields() :: []
    def(required_fields()) do
      []
    end

    @spec syntax() :: atom
    def(syntax()) do
      :proto2
    end

    [
      @spec(default(atom) :: {:ok, boolean | integer | String.t() | float} | {:error, atom}),
      def(default(:start_time)) do
        {:ok, 0}
      end,
      def(default(:end_time)) do
        {:ok, 0}
      end,
      def(default(:specific_time)) do
        {:ok, 0}
      end,
      def(default(_)) do
        {:error, :no_such_field}
      end
    ]
  )
end