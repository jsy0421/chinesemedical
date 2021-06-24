<template>
	<view class="tui-cmtbox">
		<view class="tui-cmt-cell" v-for="(item, index) in replyList" :key="index">
			<view class="tui-header-box">
				<view class="tui-userinfo-box">
					<image :src="item.avatar" class="tui-avatar"></image>
					<view class="tui-nickname-box">
						<view class="tui-cmt-nickname">{{ item.nickname }}</view>
						<view class="tui-cmt-time">{{ item.time }}</view>
					</view>
				</view>
				<view class="tui-fabulous" :class="[item.isFabulous ? 'tui-primary' : '']" :id="index"
					@tap="cmtFabulous">
					<text>{{ item.fabulous == 0 ? '赞' : item.fabulous }}</text>
					<tui-icon :name="item.isFabulous ? 'agree-fill' : 'agree'" :size="15"
						:color="item.isFabulous ? '#5677fc' : '#9a9a9a'"></tui-icon>
				</view>
			</view>
			<view class="tui-cmt-content">{{ item.content }}</view>
		</view>
	</view>
</template>

<script>
	import tuiIcon from '../../component/thorui/tui-icon/tui-icon.vue';
	export default {
		components: {
			tuiIcon
		},
		props: {
			replyList: {
				type: Array,
			}
		},
		methods:{
			cmtFabulous: function(e) {
				console.log(this.replyList);
				let index = e.currentTarget.id;
				let fabulousObj = this.replyList[index];
				let isFabulous = this.replyList[index].isFabulous;
				let fabulous = this.replyList[index].fabulous;
				let fabulousNum = isFabulous ? fabulous - 1 : fabulous + 1;
				this.$set(fabulousObj, 'fabulous', fabulousNum);
				this.$set(fabulousObj, 'isFabulous', !isFabulous);
			},
		}
	}
</script>

<style>
	@import "../../component/css/reply.css";

</style>
