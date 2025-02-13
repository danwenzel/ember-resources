import { render, settled } from '@ember/test-helpers';
import { module, test } from 'qunit';
import { setupRenderingTest } from 'ember-qunit';

import { cell } from 'ember-resources';

module('Utils | cell | rendering', function (hooks) {
  setupRenderingTest(hooks);

  test('it works', async function (assert) {
    let state = cell<string | undefined>();

    await render(<template>{{state.current}}</template>);

    assert.dom().doesNotContainText('hello');

    state.current = 'hello';
    await settled();
    assert.dom().hasText('hello');
  });

  test('it works with an initial value', async function (assert) {
    let state = cell(0);

    await render(<template>{{state.current}}</template>);

    assert.dom().hasText('0');

    state.current++;
    await settled();

    assert.dom().hasText('1');
  });
});
