# frozen_string_literal: true

class TransactionsController < ApplicationController
  include TransactionsHelper

  before_action :authenticate_request, only: :create
  protect_from_forgery with: :null_session

  def create
    respond_to do |format|
      format.json do
        new_transaction = TransactionCreator.call(params, :json)
        render_response(new_transaction, :json)
      end
      format.xml do
        new_transaction = TransactionCreator.call(params, :xml)
        render_response(new_transaction, :xml)
      end
    end
  end

  def index
    @transactions = Transaction.all
  end
end
