#
# Copyright (C) 2008-2012 NEC Corporation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#


require "trema/action"


module Trema
  #
  # An action to modify the VLAN priority of a packet.
  #
  class ActionSetVlanPcp < Action
    #
    # Creates an action to modify the VLAN priority of a packet. Valid
    # values are between (0) lowest and (7) highest. Priority bits can
    # be used to prioritize different classes of traffic.
    #
    # @example
    #   ActionSetVlanPcp.new( 7 )
    #
    # @param [Integer] :vlan_pcp
    #   the VLAN priority to set to.
    #
    # @raise [ArgumentError] if vlan_pcp argument is not supplied.
    # @raise [ArgumentError] if vlan_pcp is not within 0 and 7 inclusive.
    # @raise [TypeError] if vlan_pcp is not an Integer.
    #
    def initialize vlan_pcp
      if not vlan_pcp.is_a?( Integer )
        raise TypeError, "VLAN priority must be an unsigned 8-bit Integer"
      end
      if not ( vlan_pcp >= 0 and vlan_pcp <= 7 )
        raise ArgumentError, "Valid VLAN priority values are 0 to 7 inclusive"
      end
      @value = vlan_pcp
    end
  end
end


### Local variables:
### mode: Ruby
### coding: utf-8-unix
### indent-tabs-mode: nil
### End: