cozy_instance  = require '../models/cozyinstance'
bank           = require '../models/bank'
bank_account   = require '../models/bankaccount'
bank_operation = require '../models/bankoperation'
helper         = require '../lib/helper'

module.exports.home = (req, res) ->
	helper.getToken (err, token) ->
		if err
			res.send 200, err
		else
			cozy_instance.getInstance (err, instance) ->
				if err
					res.send 200, err
				else
					res.render 'index.jade',
						token: token
						url: instance.domain

module.exports.listAccount = (req, res) ->
	helper.getToken (err, token) ->
	if err
		res.send 200, err
	else if token isnt req.param('t')
		res.send 200,
			'status': 'bad token'
	else
		bank_account.all (err, result) ->
			result = helper.formatAccountData result
			if err
				res.send 200, err
			else if result.length is 0
				res.send 200,
				'status': 'empty'
			else
				res.send 200, result

module.exports.listOperation = (req, res) ->
	helper.getToken (err, token) ->
		if err
			res.send 200, err
		else if token isnt req.param('t')
			res.send 200,
				'status': 'bad token'
		else
			bank_operation.allFromBankAccountDate req.param('id_account'), (err, result) ->
				result = helper.formatOperationData result
				if err
					res.send 200, err
				else if result.length is 0
					res.send 200,
						'status': 'empty'
				else
					res.send 200, result