<template>
	<!-- 搜索框 -->
	<view class="cu-bar search fixed" style="width: 100%;" :style="{backgroundColor:color}">
		<view class="search-form round" style="margin: 0rpx 10rpx">
			<text class="cuIcon-search"></text>
			<input type="text" placeholder="请输入搜索内容" disabled  confirm-type="search"></input>
			<text class="cuIcon-camera" style="padding-right: 2px;font-size: 38rpx;"></text>
		</view>
		
	</view>
</template>

<script>
	export default{
		props:{
			color:{
				type:String,
				default:'#ffffff'
			}
		}
	}
</script>

<style>
</style>
