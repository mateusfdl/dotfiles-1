#!/usr/bin/env ruby

require 'scanf'

plugins = [
  "clojure",
  "crystal",
  "dart",
  "erlang",
  "elixir",
  "elm",
  "golang",
  "haskell",
  # "java",
  "kotlin",
  "kubectl",
  "minikube",
  "nodejs",
  "protoc",
  "python",
  "ruby",
  "rust",
]

def fill(arr, len, fill_value)
  len.times do |i|
    if arr[i].nil?
      arr[i] = fill_value
    end
  end
  arr
end

def sem_ver(version_str)
  major, minor, patch = version_str.scanf("%d.%d.%d")
  fill([major, minor, patch], 3, 0)
end

def greater_version(a, b)
  return -1 if a == 'stable'
  return 1 if b == 'stable'

  a_major, a_minor, a_patch = sem_ver(a)
  b_major, b_minor, b_patch = sem_ver(b)

  return -1 if a_major > b_major
  return 1 if a_major < b_major

  return -1 if a_minor > b_minor
  return 1 if a_minor < b_minor

  return -1 if a_patch > b_patch
  return 1 if a_patch < b_patch

  0
end

def install_plugin(plugin)
  `asdf plugin-add #{plugin}`
  sorted_versions =
    `asdf list-all #{plugin}`
      .split("\n")
      .grep(/^(\d+(\.\d+){1,2}|stable)$/)
      .sort { |a, b| greater_version(a, b) }

  if sorted_versions.empty?
    puts "could not find versions for #{plugin}"
  else
    latest_version = sorted_versions[0]
    puts "installing #{plugin}: #{latest_version}"
    `asdf install #{plugin} #{latest_version}`
    puts "setting asdf global #{plugin} #{latest_version}"
    `asdf global #{plugin} #{latest_version}`
  end
end

plugins.each { |p| install_plugin(p) }

puts
