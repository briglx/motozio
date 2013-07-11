<#import "/spring.ftl" as spring />
<#import "common.ftl" as c/>
<@c.page title="Admin - Schemes" activeTab="Health">


<div ng-controller="HealthCtrl">

	<div ng-switch on="healthItems.isAppAvailable">
		
            <div ng-switch-when="true" class="alert alert-block">
                <h1>Status</h1>
                <p class="lead">The system is up.</p>
            </div>

       
            <div ng-switch-when="false" class="alert alert-block alert-error">
                <h1>Status</h1>
                <p class="lead">The system needs attention.</p>
            </div>

	</div>
    <h3>Dependencies</h3>
    <table class="table">
        <thead>
        <tr>
            <th>Status</th>
            <th>Item</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>

            <tr ng-repeat="item in healthItems.items">
				<td ng-switch on="item.available" >
					<i ng-switch-when="true" class="icon-ok"></i> 
					<i ng-switch-when="false" class="icon-exclamation-sign"></i> 
				</td>
                <td>{{item.title}}</td>
                <td>{{item.description}}</td>
            </tr>
        </tbody>
    </table>

</div> <!-- /container -->

</@c.page>