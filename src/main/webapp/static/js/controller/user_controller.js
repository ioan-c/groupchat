'use strict';



angular.module('groupChat').controller('UserController', ['$scope', 'UserService',
    function($scope, UserService) {
    var self = this;
    self.user={id:0,username:'',email:'',phone:'',country:'',city:''};
    //self.users=;

    self.submit = submit;

        self.users=[];

       // self.submit = submit;
        ///self.edit = edit;
      //  self.remove = remove;
      //  self.reset = reset;


        fetchAllUsers();

        function fetchAllUsers(){
            UserService.fetchAllUsers()
                .then(
                    function(d) {
                        console.log("response "+d)
                        self.users = d;
                    },
                    function(errResponse){
                        console.error('Error while fetching Users');
                    }
                );
        }

    function createUser(user){
        UserService.createUser(user);
    }


    function submit() {
        //if(self.user.id===null){
            console.log('Saving New User', self.user);
            createUser(self.user);


      /*  }/*else{
            updateUser(self.user, self.user.id);
            console.log('User updated with id ', self.user.id);
        }*/
    //    reset();
    }

  /*   function reset(){
         self.user={id:null,username:'',address:'',email:''};
         $scope.myForm.$setPristine();
     }*/

}]);