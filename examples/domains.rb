# frozen_string_literal: true

require_relative "../lib/resend"

raise if ENV["RESEND_API_KEY"].nil?

Resend.api_key = ENV["RESEND_API_KEY"]

def create
  params = {
    name: "name",
    region: ""
  }
  domain = Resend::Domains.create(params)
  puts domain

  Resend::Domains.remove domain[:id]
  puts "deleted #{domain[:id]}"
end

def get
  domain = Resend::Domains.create({name: "test"})
  puts "created domain id: #{domain[:id]}"

  retrieved = Resend::Domains.get domain[:id]
  puts "retrieved domain: #{retrieved[:id]}"
  puts retrieved

  Resend::Domains.remove retrieved[:id]
  puts "deleted #{retrieved[:id]}"
end

def list
  domains = Resend::Domains.list
  puts domains
end

def remove
  domain = Resend::Domains.create({name: "test"})
  puts "created domain id: #{domain[:id]}"
  Resend::Domains.remove domain[:id]
  puts "deleted #{domain[:id]}"
end

def verify
  domain = Resend::Domains.create({name: "test2"})
  puts "created domain id: #{domain[:id]}"

  Resend::Domains.verify domain[:id]
  puts "verified #{domain[:id]}"

  Resend::Domains.remove domain[:id]
  puts "deleted #{domain[:id]}"
end

create
get
list
remove
verify
