const express = require('express');
const mysql = require('mysql');
const db = mysql.createPool({
	host: 'localhost',
	user: 'root',
	password: 'root',
	database: 'chinesemedical'
});

module.exports = () => {
	const route = express.Router();
	route.get('/recommended', (req, res) => {
		const sql = 'select image,page,name,detail from goodslist';
		getData(sql, res);
	});

	function getData(sql, res) {
		db.query(sql, (err, data) => {
			if (err) {
				console.log(err);
				res.status(500).send('database err').end();
			} else {
				if (data.length == 0) {
					res.status(500).send('no datas').end();
				} else {
					res.send(data);
				}
			}
		});
	};

	route.get('/slideBar', (req, res) => {
		const sql = 'select url,name,page from menulist';
		getData(sql, res);
	});

	route.get('/news', (req, res) => {
		const sql = 'select * from news';
		getData(sql, res);
	});

	route.get('/newsdetail', (req, res) => {
		const sql = `select * from newsdetail`;
		getData(sql, res);
	});

	route.get('/newsarticle', (req, res) => {
		const sql = `select * from newsarticle where newsId = (select articleId from newsdetail)`;
		getData(sql, res);
	});

	route.get('/newsImg', (req, res) => {
		const sql = `select * from newsimg where newsId = (select newImgId from newsdetail)`;
		getData(sql, res);
	});

	route.get('/newsreply', (req, res) => {
		const sql = `select * from cmtlist`;
		getData(sql, res);
	});

	route.get('/replydetail', (req, res) => {
		const sql = `select * from replylist where replyId = (select reply from cmtlist)`;
		getData(sql, res);
	});

	route.get('/login', (req, res) => {
		let phoneNumber = req.query.phoneNumber;
		let password = req.query.password;
		if (phoneNumber != '') {
			const sql = `select * from user where phoneNumber = '${phoneNumber}'`;
			db.query(sql, (err, data) => {
				if (err) {
					console.log(err);
					res.send({
						'msg': '服务器出错',
						'status': 0
					}).end();
				} else {
					if (data.length == 0) {
						res.send({
							'msg': '该用户不存在',
							'status': -1
						}).end();
					} else {
						let dataw = data[0];
						//login sucess
						if (dataw.password === password) {
							//save the session 
							req.session['phoneNumber'] = dataw.phoneNumber;
							dataw.msg = "登录成功";
							dataw.status = 1;
							res.send(dataw).end();
						} else {
							res.send({
								'msg': '密码不正确',
								'status': -2
							}).end();
						}
					}
				}
			});
		}
	});

	route.get('/reg', (req, res) => {
		let phoneNumber = req.query.phoneNumber;
		let password = req.query.password;
		const sql1 = `select * from user where phoneNumber = '${phoneNumber}'`;
		const sql2 = `INSERT INTO user(phoneNumber,password) VALUES('${phoneNumber}','${password}')`;
		
		db.query(sql1, (err, data) => {
			if (err) {
				console.log(err);
				res.send({
					'msg': '服务器出错',
					'status': 0
				}).end();
			} else {
				if (data.length == 1) {
					res.send({
						'msg': '该用户已存在',
						'status': -1
					}).end();
				} else {
					Reg(sql2, res);
				}
			}
		});
		
		
	});

	function Reg(sql, res) {
		db.query(sql, (err) => {
			if (err) {
				console.error(err);
				res.send({
					'msg': '服务器出错',
					'status': 0
				}).end();
			} else {
				res.send({
					'msg': '注册成功',
					'status': 1
				}).end();
			}
		})
	};

	route.get('/forgetPwd', (req, res) => {
		let phoneNumber = req.query.phoneNumber;
		let password = req.query.password;

		const sql1 = `select * from user where phoneNumber = '${phoneNumber}'`;
		const sql2 = `UPDATE user SET password = '${password}' where phoneNumber = ${phoneNumber}`;

		db.query(sql1, (err, data) => {
			if (err) {
				console.log(err);
				res.send({
					'msg': '服务器出错',
					'status': 0
				}).end();
			} else {
				if (data.length == 0) {
					res.send({
						'msg': '该用户不存在',
						'status': -1
					}).end();
				} else {
					let dataw = data[0];
					if (dataw.password === password) {
						res.send({
							'msg': '新密码与原密码相同',
							'status': -1
						}).end();
					} else {
						db.query(sql2, (err) => {
							if (err) {
								console.error(err);
								res.send({
									'msg': '服务器出错',
									'status': 0
								}).end();
							} else {
								res.send({
									'msg': '密码修改成功',
									'status': 1
								}).end();
							}
						})
					}
				}
			}
		});
	});

	route.get('/medicaldetail', (req, res) => {
		let medicalName = req.query.medicalName;
		const sql = `select * from medical where medicalName = '${medicalName}'`;
		getData(sql, res);
	});

	route.get('/medicaldetailImg', (req, res) => {
		let medicalName = req.query.medicalName;
		const sql = `select medicalImg from medicalimg where medicalName = '${medicalName}'`;
		getData(sql, res);
	})

	route.get('/addComment', (req, res) => {
		let content = req.query.content;
		let img = req.query.img;
		const sql2 = `INSERT INTO replylist(replyId,avatar,nickname,fabulous,content,time) VALUES('1','${img}','123','0','${content}',NOW())`;
		Reg(sql2, res);
	});
	
	return route;
}
