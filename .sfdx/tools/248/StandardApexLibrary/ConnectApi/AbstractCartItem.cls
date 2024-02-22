/**
 * @description       : 
 * @author            : emeza@freewayconsulting.com
 * @group             : 
 * @last modified on  : 02-22-2024
 * @last modified by  : emeza@freewayconsulting.com 
 * Modifications Log
 * Ver   Date         Author                        Modification
 * 1.0   02-22-2024   emeza@freewayconsulting.com   Initial Version
**/
global class AbstractCartItem {
	global ConnectApi.BillingFrequency billingFrequency;
	global String cartDeliveryGroupId;
	global String cartId;
	global String cartItemId;
	global ConnectApi.CartMessagesSummary messagesSummary;
	global String name;
	global ConnectApi.CartItemProduct productDetails;
	global String productId;
	global String productSellingModelId;
	global String quantity;
	global ConnectApi.SellingModelType sellingModelType;
	global Integer subscriptionTerm;
	global ConnectApi.CartItemType type;
	global Object clone() { }
	global Boolean equals(Object obj) { }
	global Double getBuildVersion() { }
	global Integer hashCode() { }
	global String toString() { }

}