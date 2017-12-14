class Api::V1::MetadatasController < ApplicationController
  def index
    @trans = Translation.all.to_a
    @r_trans = {}
    @trans.each { |record| @r_trans["#{record.key}"] = record.translation }
    @response = {
      translations: @r_trans,
    }
    render_success @response
  end
end
