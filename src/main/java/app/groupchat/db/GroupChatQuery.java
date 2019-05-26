package app.groupchat.db;

public class GroupChatQuery {
    public static final String INSERT_USER = "INSERT INTO public.users(\n" +
                                            "id_user, password, username, email, phone, country, city)\n" +
                                            "VALUES ((SELECT max(id_user)+1 FROM users), :password, :username, :email, :phone, :country, :city)";
    public static final String INSERT_ROOM = "INSERT INTO public.rooms(\n" +
            "id_room, name)\n" +
            "VALUES ((SELECT max(id_room)+1 FROM rooms), :name)";
    public static final String INSERT_MESSAGE = "INSERT INTO public.messages(\n" +
            "id_message, content, id_user, date, id_room)\n" +
            "VALUES ((SELECT COALESCE ( max(id_message),  0)+1 FROM messages), :content, :id_user, :date, :id_room)";
}