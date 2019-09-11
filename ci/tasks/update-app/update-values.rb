#!/usr/bin/env ruby

require 'fileutils'
require 'yaml'

class TaskCommand
  attr_reader :root_dir, :tag, :values_file

  def self.execute(root_dir, tag)
    new(root_dir, tag).execute
  end

  def initialize(root_dir, tag)
    @root_dir = root_dir
    @tag = tag
    @values_file = File.expand_path('values.yaml', root_dir)
  end

  def execute
    values = YAML.load_file(values_file)
    values['image']['tag'] = tag
    File.write(values_file, values.to_yaml)
  end
end

TaskCommand.execute(Dir.pwd, ARGV[0]) if __FILE__ == $PROGRAM_NAME
