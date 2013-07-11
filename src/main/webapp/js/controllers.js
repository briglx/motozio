//var app = angular.module('apolAdmin', ['$strap.directives']);


// Define Controllers for the app
function SchemeListCtrl($scope, $http) {

    $http.defaults.headers.common['Content-Type'] = 'application/json';


    // Populate scheme list
    $http.get('/services/v1/schemes').success(function (data) {
        $scope.schemes = data;
    });

    $scope.addScheme = function () {

        // Create a new scheme model
        var newScheme = {"label": $scope.newSchemeLbl, "description": $scope.newSchemeDesc};

        console.log("API - attempting to Add new scheme " + newScheme.label + " with desc: " + newScheme.description);

        $http.post('/services/v1/schemes', newScheme).success(function (data) {

            console.log("API - Added new scheme " + data);
            newScheme = data;

            // Update UI
            $scope.schemes.push(newScheme);
            $scope.newSchemeLbl = "";
            $scope.newSchemeDesc = "";

        }).error(function (data) {
                console.log('Error adding scheme' + data);

            });

    }

    $scope.removeScheme = function (idx) {

        var scheme = $scope.schemes[idx];

        console.log("API - Remove scheme " + scheme.shortId);

        $http({method: 'DELETE', url: '/services/v1/schemes/' + scheme.shortId, headers: {"Content-Type": "application/json"}}).success(function (data) {

            console.log(data);

            // Update UI
            $scope.schemes.splice(idx, 1);

        }).error(function (data) {
                console.log('Error deleting scheme ' + data);
        });

    }
    $scope.showUploadModal = function(){
        $('#uploadJsonModal').modal('show');
    }

    $scope.uploadJson = function(){
        $scope.modalTitle = "building tree...";

        $http.post('/services/v1/schemes/deepUpload', $scope.jsonPayload).success(function (data) {

            console.log("API - Added new scheme " + data);
            $scope.modalTitle = "Successfully Imported scheme";
            newScheme = data;

            // Update UI
            $scope.schemes.push(newScheme);
            $scope.newSchemeLbl = "";
            $scope.newSchemeDesc = "";

        }).error(function (data) {
            $scope.modalTitle = "Error adding scheme: " + data;
            console.log('Error adding scheme' + data);
        });
    }
}



function FooterCtrl($scope, $http){

    $http.get('api/v1/footer').success(function (data) {
        $scope.footer = data;
    });


}


// Helper functions


// Return the right most split of URL. Based on 0 index
function getUrlRight(url, idx) {


    var parts = url.substr().split("/");

    var len = parts.length;

    return parts[(len-1) - idx];

}

function removeLastHash (myUrl)
{
    if (myUrl.substring(myUrl.length-1) == "#")
    {
        myUrl = myUrl.substring(0, myUrl.length-1);
    }

    return myUrl;
}


