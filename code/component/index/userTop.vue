<template>
	<view class="top-container">
		<view class="logout" hover-class="opcity" :hover-stay-time="150"></view>
		<view class="user-wrapper">
			<navigator :url="url" hover-class="opcity" :hover-stay-time="150" class="user">
				<image class="avatar-img" src="../../static/my/touxiang.png"></image>
				<text class="user-info-mobile">{{ mobile }}</text>
			</navigator>
		</view>
	</view>
</template>

<script>
	export default{
		props:{
			url:{
				type:String,
				default:"../login/login/login"
			},
			mobile:{
				type:String,
				default:"请登录"
			}
		}
	}
</script>

<style>
	.logout {
		width: 110rpx;
		height: 36rpx;
		display: flex;
		flex-direction: row;
		align-items: center;
		margin: 42rpx 0 24rpx 32rpx;
		position: relative;
		z-index: 2;
	}
	
	.user-wrapper {
		display: flex;
		justify-content: center;
		position: relative;
		z-index: 2;
	}
	
	.user {
		display: flex;
		flex-direction: column;
		justify-content: center;
		position: relative;
		z-index: 2;
	}
	
	.avatar-img {
		width: 160rpx;
		height: 160rpx;
		border-radius: 50%;
		align-self: center;
	}
	
	.user-info-mobile {
		margin-top: 30rpx;
		margin-bottom: 60rpx;
		position: relative;
		font-size: 28rpx;
		color: #000000;
		line-height: 28rpx;
		align-self: center;
		padding: 0 50rpx;
	}
</style>
