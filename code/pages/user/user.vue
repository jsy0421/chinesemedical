<template>
	<view class="container">
		<!-- 头像 -->
		<useTop :url="url" :mobile="mobile"></useTop>
		<!-- 我的收藏，浏览记录 -->
		<userCollection></userCollection>
		<!-- 设置等 -->
		<userSet></userSet>

	</view>
</template>

<script>
	import tuiIcon from "../../component/thorui/tui-icon/tui-icon.vue"
	import useTop from '../../component/index/userTop.vue'
	import userCollection from "../../component/index/userCollection.vue"
	import userSet from '../../component/index/userSet.vue'
	export default {
		components: {
			tuiIcon,
			userCollection,
			userSet,
			useTop
		},
		data() {
			return {
				mobile: '请登录',
				url: "../login/login/login",
			};
		},
		onLoad: function(option) {
			if (option.id != undefined) {
				this.mobile = option.id;
				this.url = ''
			}
		},
		onPullDownRefresh: function() {
			// 下拉刷新
			console.log('refresh');
			setTimeout(function() {
				uni.stopPullDownRefresh();
			}, 1000);
		},
	};
</script>

<style>
	.container {
		position: relative;
		padding-bottom: 100rpx;
	}
</style>
