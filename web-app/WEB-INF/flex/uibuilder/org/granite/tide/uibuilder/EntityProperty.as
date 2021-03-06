/*
  GRANITE DATA SERVICES
  Copyright (C) 2009 ADEQUATE SYSTEMS SARL

  This file is part of Granite Data Services.

  Granite Data Services is free software; you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as published by
  the Free Software Foundation; either version 3 of the License, or (at your
  option) any later version.

  Granite Data Services is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
  FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License
  for more details.

  You should have received a copy of the GNU Lesser General Public License
  along with this library; if not, see <http://www.gnu.org/licenses/>.
*/

package org.granite.tide.uibuilder {
	
	import mx.core.IUIComponent;
	import mx.validators.Validator;
	
	
    public class EntityProperty {
    	
    	public var property:String;
    	public var component:IUIComponent;
    	public var editorDataField:String;
    	public var percentWidth:int = -1;
    	public var validator:Validator;
    	public var parser:Function;
    	public var entityField:String;
    	public var bound:Boolean = true;
    }
}