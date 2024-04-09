# VS Code Snippets

My snippets:

```json
{
	"RFCTD": {
		"prefix": "gsrfctr",
		"body": [
		  "import * as React from 'react';",
		  "",
		  "interface FooterProps {",
		  "  name: string;",
		  "}",
		  "",
		  "export default (({ name }) => {",
		  "  return <h1>{name}</h1>;",
		  "}) as React.SFC<FooterProps>;",
		  ""
		],
		"description": "RFCTD"
	},
	"gsrfcjs": {
		"prefix": "gsrfcjs",
		"body": [
		  "import React from 'react';",
		  "",
		  "const inputChanged = () => {",
		  "  console.log('inputChanged'); // eslint-disable-line",
		  "};",
		  "",
		  "export default () => (",
		  "  <>",
		  "    <input",
		  "      onChange={() => {",
		  "        inputChanged();",
		  "      }}",
		  "    />",
		  "  </>",
		  ");",
		  "",
		  "export const AdditinalInputComponent = () => (",
		  "  <>",
		  "    <input",
		  "      onChange={() => {",
		  "        inputChanged();",
		  "      }}",
		  "    />",
		  "  </>",
		  ");",
		  ""
		],
		"description": "gsrfcjs"
	  },
	  "gsrfcrxjs": {
		"prefix": "gsrfcrxjs",
		"body": [
		  "import * as actions from '../actions/actions';",
		  "",
		  "const _ = require('lodash');",
		  "",
		  "const initialState = {",
		  "  welcomeText: 'Velkommen til denne siden',",
		  "  inputText: 'Standard input tekst',",
		  "};",
		  "",
		  "const componentreducer = (prevState = initialState, action) => {",
		  "  let newState;",
		  "  switch (action.type) {",
		  "    case actions.CHANGE_WELCOME_TEXT:",
		  "      newState = _.assign({}, prevState);",
		  "      newState.welcomeText = 'Magnus Carlsen er god i sjakk';",
		  "      if (action.data) {",
		  "        newState.welcomeText = action.data;",
		  "      }",
		  "      return newState;",
		  "    case actions.INPUT_CHANGED:",
		  "      newState = { ...prevState, inputText: action.data };",
		  "      return newState;",
		  "    default:",
		  "      return initialState;",
		  "  }",
		  "};",
		  "",
		  "export default componentreducer;",
		  ""
		],
		"description": "gsrfcrxjs"
	  },
	  "gsrxreducer": {
		"prefix": "gsrxreducer",
		"body": [
		  "import * as actions from '../actions/actions';",
		  "",
		  "const _ = require('lodash');",
		  "",
		  "const initialState = {",
		  "  welcomeText: 'Velkommen til denne siden',",
		  "  inputText: 'Standard input tekst',",
		  "};",
		  "",
		  "const componentreducer = (prevState = initialState, action) => {",
		  "  let newState;",
		  "  switch (action.type) {",
		  "    case actions.CHANGE_WELCOME_TEXT:",
		  "      newState = _.assign({}, prevState);",
		  "      newState.welcomeText = 'Magnus Carlsen er god i sjakk';",
		  "      if (action.data) {",
		  "        newState.welcomeText = action.data;",
		  "      }",
		  "      return newState;",
		  "    case actions.INPUT_CHANGED:",
		  "      newState = { ...prevState, inputText: action.data };",
		  "      return newState;",
		  "    default:",
		  "      return initialState;",
		  "  }",
		  "};",
		  "",
		  "export default componentreducer;",
		  ""
		],
		"description": "gsrxreducer"
	  },
	"React.FC": {
		"prefix": "gsrfcts",
		"body": [
			"import * as React from 'react';",
			"",
			"interface WelcomeProps {",
			"  name: string;",
			"}",
			"",
			"export const Welcome: React.FC<WelcomeProps> = ({ name }) => {",
			"  return <h1>Hello! {name}</h1>;",
			"};",
			""
		],
		"description": "React.FC"
	},
	"console.log": {
		"prefix": "cl",
		"body": [
			"console.log($1)"
		],
		"description": "console.log"
	},
	"console.log.stringify": {
		"prefix": "clst",
		"body": [
			"console.log(JSON.stringify($1, null, 2))"
		],
		"description": "console.log"
	},
	"pre.stringify": {
		"prefix": "prest",
		"body": [
			"<pre>{JSON.stringify($1, null, 2)}</pre>"
		],
		"description": "console.log"
	},
	"eof-k": {
		"prefix": "eof",
		"body": [
		  "kubectl apply -f - <<EOF",
		  "$1",
		  "EOF",
		  ""
		],
		"description": "eof kubectl"
	},
	"eof-echo": {
		"prefix": "eof-echo",
		"body": [
		  "cat <<EOF",
		  "$1",
		  "EOF",
		  ""
		],
		"description": "eof echo"
	},
	"Flexbox Sample 1": {
		"prefix": "fbsample1",
		"body": [
		  "<style>",
		  ".container { ",
		  "  display: flex;",
		  "  }",
		  ".red {",
		  "  background: orangered;",
		  "  flex-grow: 1;",
		  "}",
		  ".green {",
		  "  background: yellowgreen;",
		  "}",
		  ".blue {",
		  "  background: steelblue;",
		  "}",
		  ".container > div {",
		  "  font-size: 5vw;",
		  "  padding: .5em;",
		  "  color: white;",
		  "}",
		  "</style>",
		  "<div class=\"container\">",
		  "  <div class=\"red\">1</div>",
		  "  <div class=\"green\">2</div>",
		  "  <div class=\"blue\">3</div>",
		  "</div>"
		],
		"description": "Flexbox Sample 1"
	  },
	  "PropTypes": {
		"prefix": "pt",
		"body": [
		  "import PropTypes from 'prop-types';",
		  "",
		  "Greeting.propTypes = {",
		  "  name: PropTypes.string",
		  "};"
		],
		"description": "PropTypes"
	  },
	"Code Block": {
	  "prefix": "cb",
	  "body": [
	    "```",
	    "$1",
	    "```"
	  ],
	  "description": "Code Block"
	}

}
```
