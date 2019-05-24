<!DOCTYPE HTML>
<html>
   <head>
      <meta charset="UTF-8" />
      <title>GroupChat Home</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

      <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
      <script src="/js/main.js"></script>

      <link href="../../static/css/groupchat.css" rel="stylesheet" type="text/css">
   </head>

   <body>
   <%@ include file="/WEB-INF/jsp/navigation.jsp" %>

      <div id="username-page">
         <div class="username-page-container">
            <h1 class="title">Type your username</h1>
            <form id="usernameForm" name="usernameForm">
               <div class="form-group">
                  <input type="text" id="name" placeholder="Username" autocomplete="off" class="form-control" />
               </div>
               <div class="form-group">
                  <button type="submit" class="accent username-submit">Start Chatting</button>
               </div>
            </form>
         </div>
      </div>

      <div id="chat-page" class="hidden">
         <div class="chat-container">
            <div class="chat-header">
               <h2>Chat</h2>
            </div>
            <div class="connecting">
               Connecting...
            </div>
            <ul id="messageArea">

            </ul>
            <form id="messageForm" name="messageForm">
               <div class="form-group">
                  <div class="input-group clearfix">
                     <input type="text" id="message" placeholder="Type a message..." autocomplete="off" class="form-control"/>
                     <button type="submit" class="primary">Send</button>
                  </div>
               </div>
            </form>
         </div>
      </div>


   </body>

</html>
