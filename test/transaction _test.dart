import 'package:sample_tendermint/api_calls/wallet_api.dart';
import 'package:sample_tendermint/global.dart';
import 'package:test/test.dart';

void main() {
  WalletApi api = WalletApi();

  test('Import wallet', () {
    api.importWallet(
        mnemonicString:
            'trade thrive unit upset nominee genuine order volume boring habit long sword bargain trigger fragile cause swallow party combine label present issue lemon swallow',
        walletAlias: 'Waleed');
  });

  test('Get wallet balances', () async {
    var balances =
        await api.getWalletBalances(globalCache.wallets.first.walletAddress);
    print(balances.balances[1].amount);
  });

  test('Make a transaction from Alice to Bob', () async {
    await api.sendAmount(
      toAddress: 'cosmos1mpj7nlxz0hlj6etlc8m000nyj6wpj3wql8xav8',
      fromAddress: globalCache.wallets.first.walletAddress,
      amount: '10',
      denom: 'token',
    );
  });

  test('Get wallet balances', () async {
    await Future.delayed(Duration(seconds: 2));
    var balances =
        await api.getWalletBalances(globalCache.wallets.first.walletAddress);
    print(balances.balances[1].amount);
  });
}
