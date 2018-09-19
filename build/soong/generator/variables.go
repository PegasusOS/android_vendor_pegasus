package generator

import (
	"fmt"

	"android/soong/android"
)

func pegasusosExpandVariables(ctx android.ModuleContext, in string) string {
	pegasusosVars := ctx.Config().VendorConfig("pegasusosVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if pegasusosVars.IsSet(name) {
			return pegasusosVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
