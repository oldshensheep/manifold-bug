package org.example;

import com.oldshensheep.schema.DB;
import manifold.sql.rt.api.TxScope;

public class User {


  public static void changeChatMod(TxScope txScope, long fromId, boolean enable) {
    DB.addSqlChange(ctx -> {
      """
          [.sql/]
              MERGE INTO abcfgh as target
              USING (select 1)
              ON target.from_id = ?
              WHEN MATCHED THEN
                  update
                  SET enable = ?
              WHEN NOT MATCHED THEN
                  INSERT (from_id, enable)
                  VALUES (?, ?)""".execute(ctx);
    });
  }
}
