#-*- coding: utf-8 -*-
class Facebook::OauthsController < ApplicationController

  def welcome

    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end

  def redirect
    cookies[:access_token] = Koala::Facebook::OAuth.new(redirect_facebook_oauths_url).get_access_token(params[:code]) if params[:code]
    logger.debug "oauth_log: #{cookies}"
    redirect_to cookies[:access_token] ? facebook_timelines_url : "http://www.facebook.com/"
  end
end
