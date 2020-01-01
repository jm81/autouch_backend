defmodule AutouchBackend.Session do
  require Logger

  alias AutouchBackend.Repo
  alias AutouchBackend.AuthMethod
  alias AutouchBackend.User

  import Ecto.Query, only: [from: 2]

  defstruct current_user: nil

  def authenticate(conn) do
    [auth_header | _tail] = Plug.Conn.get_req_header(conn, "authorization")
    if auth_header do
      captures = Regex.named_captures(~r/bearer\s+(?<token>.*)/i, auth_header)
      if captures do
        # TODO figure this out

        auth_method = Repo.one(
          from auth_method in AuthMethod,
          where: auth_method.provider_id == ^captures["token"]
        )

        if !auth_method do
          user = Repo.insert!(%User{display_name: "Unknown"})
          auth_method = Repo.insert!(
            %AuthMethod{
              user_id: user.id,
              provider_name: "ios",
              provider_id: captures["token"]
            }
          )
        end

        Logger.debug auth_method.id
      end
    end
  end
end
