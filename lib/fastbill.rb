require "fastbill/version"

module Fastbill
  require "excon"
  require "json"
  require "hashie"

  autoload :Model, "fastbill/model"
  autoload :Configuration, "fastbill/configuration"
  autoload :Request, "fastbill/request"
  autoload :Result, "fastbill/result"
  autoload :Error, "fastbill/error"
  autoload :Customer, "fastbill/customer"
  autoload :Invoice, "fastbill/invoice"
  autoload :Expense, "fastbill/expense"
  autoload :Template, "fastbill/template"
end
