from ib_insync import IB

def get_cash_balance():
    ib = IB()
    ib.connect('127.0.0.1', 4001, clientId=1)

    account = ib.accountSummary()

    usd_cash = None

    for item in account:
        if item.tag in ["CashBalance", "TotalCashBalance", "TotalCashValue"]:
            print(f"{item.tag}: {item.value} {item.currency}")
            if item.currency == "USD" and usd_cash is None:
                usd_cash = float(item.value)

    ib.disconnect()
    return usd_cash

# Ejecutar si se llama como script principal
if __name__ == "__main__":
    cash = get_cash_balance()
    if cash is not None:
        print(f"\n💵 Cash USD disponible: {cash}")
    else:
        print("\n❌ No se encontró cash en USD.")
